<style type="text/css">
/* custom styles for this example */
#dt-pag-nav { margin-bottom:1ex; } /* custom pagination UI */
#dt-pag-nav a {
    color: #00c;
    text-decoration: underline;
}
#yui-history-iframe {
  position:absolute;
  top:0; left:0;
  width:1px; height:1px; /* avoid scrollbars */
  visibility:hidden;
}
</style>
<script type="text/javascript" src="<?php echo url::base(); ?>js/yuilist.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var url = "<?php echo $url; ?>";
    var key = "<?php echo $key; ?>";
    var fields = ["<?php echo implode('", "', $fields); ?>"];
    // Column definitions
    var myColumnDefs = [ <?php 
                        $array = array();
                        foreach($myColumnDefs as $c){
                            $array[] = json_encode($c);
                        }
                        echo implode(', ', $array);
                        ?> ];
    var containers = 'dt'; //翻页的容器
    yuilist(url, key, fields, myColumnDefs, containers, '<?php echo $urlquery; ?>');
});
</script>
<div>
<form action="<?php echo url::site('admin/article/manage'); ?>" method="get">
    <input type="text" name="key" value="<?php echo $this->input->get('key'); ?>" />
    <input type="submit" value="搜索" />
</form>
</div>
<h1><?php echo $title; ?></h1>
<div class="yui-skin-sam">
<iframe id="yui-history-iframe" src="<?php echo url::base(); ?>blank.html"></iframe>
<input id="yui-history-field" type="hidden">

<div id="dt"></div>
<div id="serverintegration"></div>

</div>