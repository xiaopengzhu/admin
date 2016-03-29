<?php

use App\Services\Routes as RoutesManager;

//这里可以写一些路由覆盖掉RoutesManager
//.....

$routesManager = new RoutesManager();
$routesManager->admin();