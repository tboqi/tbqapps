function yuilist(url, sortkey, fields, myColumnDefs, containers, urlquery) {
	var History = YAHOO.util.History, myPaginator, myDataSource, myDataTable;

	var generateStateString = function(start, key, dir) {
		start = start || 0;
		key = key || sortkey;
		dir = dir || 'asc';
		return "/15/" + start + "/" + key + "/" + dir + urlquery;
	};

	//function to extract the key values from the state string
	var parseStateString = function(state) {
		if(state.indexOf("?") >= 0) {
			state = state.substring(0, state.indexOf("?"));
		}
		
		if(state.indexOf("/") == 0) {
			state = state.substring(1, state.length);
		}
		
		var arr = state.split("/");
		
		return {
			results :parseInt(arr[0]),
			startIndex :parseInt(arr[1]),
			sort :arr[2],
			dir :arr[3]
		};
	};

	// function used to intercept pagination requests
	var handlePagination = function(state, datatable) {
		var sortedBy = datatable.get('sortedBy');

		var newState = generateStateString(state.recordOffset, sortedBy.key,
				sortedBy.dir);

		History.navigate("myDataTable", newState);
	};

	// function used to intercept sorting requests
	var handleSorting = function(oColumn) {
		// Which direction
		var sDir = "asc";

		// Already sorted?
		if (oColumn.key === this.get("sortedBy").key) {
			sDir = (this.get("sortedBy").dir === "asc") ? "desc" : "asc";
		}

		var newBookmark = generateStateString(0, oColumn.key, sDir);

		YAHOO.util.History.navigate("myDataTable", newBookmark);
	};

	var handleHistoryNavigation = function(state) {
		// Create a payload to pass through the DataSource request to the
		// handler
		var parsed = parseStateString(state);

		// Use the DataTable's baked in server-side pagination handler
		myDataSource.sendRequest(state, {
			success :myDataTable.onDataReturnSetRows,
			failure :myDataTable.onDataReturnSetRows,
			scope :myDataTable
		});
	};

	var initialState = History.getBookmarkedState('myDataTable')
			|| generateStateString(0, sortkey, 'asc');
//	var initialState = generateStateString(0, sortkey, 'asc');

	History.register('myDataTable', initialState, handleHistoryNavigation);

	History.onReady( function() {
		// Pull the state from the History Manager, or default from the
			// initial state. Parse the state string into an object literal.
			var initialRequest = History.getCurrentState('myDataTable')
					|| initialState, state = parseStateString(initialRequest);

			// Create the DataSource
			myDataSource = new YAHOO.util.DataSource(url);
			myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
			myDataSource.responseSchema = {
				resultsList :"records",
				fields : fields,
				metaFields : {
					totalRecords :"totalRecords",
					paginationRecordOffset :"startIndex",
					sortKey :"sort",
					sortDir :"dir"
				}
			};

			// Create the DataTable configuration and Paginator using the state
			// information we pulled from the History Manager
			myPaginator = new YAHOO.widget.Paginator(
					{
						containers : [ containers ],
						pageLinks :5,
						rowsPerPage :15,
						rowsPerPageOptions : [ 15, 30, 60 ],
						template :"<strong>{CurrentPageReport}</strong> {PreviousPageLink} {PageLinks} {NextPageLink} {RowsPerPageDropdown}"
					});

			var myConfig = {
				paginator :myPaginator,
				paginationEventHandler :handlePagination,
				// generateRequest : generateStateString, // moot
				sortedBy : {
					key :state.sort,
					dir :state.dir
				},
				initialRequest :initialRequest
			};

			// Instantiate DataTable
			myDataTable = new YAHOO.widget.DataTable(
					"serverintegration", // The dom element to contain the DataTable
					myColumnDefs, // What columns will display
					myDataSource, // The DataSource for our records
					myConfig // Other configurations
			);

			// Listen to header link clicks to sort the column
			myDataTable.subscribe('theadCellClickEvent',
					myDataTable.onEventSortColumn);

			// Override the DataTable's sortColumn method with our intercept handler
			myDataTable.sortColumn = handleSorting;

			// Add the example objects to the YAHOO.example namespace for inspection
			YAHOO.example.ServerIntegration = {
				myPaginator :myPaginator,
				myDataSource :myDataSource,
				myDataTable :myDataTable
			};
		});

	YAHOO.util.History.initialize("yui-history-field", "yui-history-iframe");
}