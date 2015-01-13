README
======

This directory should be used to place project specfic documentation including
but not limited to project notes, generated API/phpdoc documentation, or 
manual files generated or hand written.  Ideally, this directory would remain
in your development environment only and should not be deployed with your
application to it's final production location.


Setting Up Your VHOST
=====================

The following is a sample VHOST you might want to consider for your project.

<VirtualHost *:80>
   DocumentRoot "/media/data/workspace/neusoft/zendtest/public"
   ServerName zendtest

   # This should be omitted in the production environment
   SetEnv APPLICATION_ENV development
    
   <Directory "/media/data/workspace/neusoft/zendtest/public">
       Options Indexes MultiViews FollowSymLinks
       AllowOverride All
       Order allow,deny
       Allow from all
   </Directory>
    
</VirtualHost>

导入zend library
ln -s /media/data/resource/php/ZendFramework-1.11.1-minimal/library/Zend/ Zend