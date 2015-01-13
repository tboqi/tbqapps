/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cc.cw.web;

import java.util.Enumeration;

import javax.servlet.ServletContext;

import org.apache.hadoop.conf.Configuration;


/** Utility to create Hadoop {@link Configuration}s that include Nutch-specific
 * resources.  */
public class CwConfiguration {
  
  private final static String KEY = CwConfiguration.class.getName();
  
  private CwConfiguration() {}                 // singleton

  /** Create a {@link Configuration} for Nutch. */
  public static Configuration create() {
    Configuration conf = new Configuration();
    addSearchResources(conf);
    return conf;
  }

  /**
   * Create a {@link Configuration} for Nutch front-end.
   *
   * If a {@link Configuration} is found in the
   * {@link javax.servlet.ServletContext} it is simply returned, otherwise,
   * a new {@link Configuration} is created using the {@link #create()} method,
   * and then all the init parameters found in the
   * {@link javax.servlet.ServletContext} are added to the {@link Configuration}
   * (the created {@link Configuration} is then saved into the
   * {@link javax.servlet.ServletContext}).
   *
   * @param application is the ServletContext whose init parameters
   *        must override those of Nutch.
   */
  @SuppressWarnings("unchecked")
public static Configuration get(ServletContext application) {
    Configuration conf = (Configuration) application.getAttribute(KEY);
    if (conf == null) {
      conf = create();
      Enumeration e = application.getInitParameterNames();
      while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        conf.set(name, application.getInitParameter(name));
      }
      application.setAttribute(KEY, conf);
    }
    return conf;
  }
  
  /** Add the standard Nutch resources to {@link Configuration}. */
  public static Configuration addSearchResources(Configuration conf) {
    conf.addDefaultResource("cw-default.xml");
    conf.addFinalResource("cw-site.xml");
    return conf;
  }
  
}

