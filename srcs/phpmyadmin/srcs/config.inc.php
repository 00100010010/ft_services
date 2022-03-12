<?php


$cfg['blowfish_secret'] = 'dKt0yp1[Pjzmjw:T}-yxVsTG/P5ZywmX';


$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

 $cfg['Servers'][$i]['port'] = '3306';
 $cfg['Servers'][$i]['controluser'] = 'admin';
 $cfg['Servers'][$i]['controlpass'] = 'admin';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
