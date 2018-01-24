<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
*/
$route['default_controller'] = "campaign";
$route['(\w{2})/past-campaigns'] = "campaign/campaigns";
$route['(\w{2})/past-campaigns/(:any)'] = "campaign/campaigns/$2";
$route['(\w{2})/campaigns'] = "campaign/campaigns";
$route['(\w{2})/campaigns/(:any)'] = "campaign/campaigns/$2";
$route['(\w{2})/campaigns/(:any)'] = "campaign/campaigns/$2";
$route['(\w{2})/organization/(:any)'] = "organization/index/$2";
$route['(\w{2})/dashboard/(:any)'] = "dashboard/index/$2";
$route['(\w{2})/register'] = "login/register";
$route['(\w{2})/confirm-registration/(:any)'] = "login/confirm_registration/$2";
$route['(\w{2})/forgot-password'] = "login/forgot_password";
$route['(\w{2})/forgot-password/(:any)'] = "login/forgot_password/$2";
$route['(\w{2})/how-to-donate'] = "page_modules/how_to_donate";
$route['(\w{2})/emergency-pool'] = "page_modules/emergency_pool";
$route['(\w{2})/dashboards/user_donations'] = "dashboard/user_donations";
$route['(\w{2})/dashboards/campaign_tables'] = "dashboard/campaign_tables";
$route['(\w{2})/dashboards/connect_with_twitter'] = "dashboard/connect_with_twitter";
$route['(\w{2})/dashboards/proof_of_charity_table'] = "dashboard/proof_of_charity_table";
$route['(\w{2})/twitter-auth'] = "dashboard/connect_with_twitter";
$route['(\w{2})/twitter-logout'] = "dashboard/twitter_logout";
$route['404_override'] = '';
$route['(\w{2})/(.*)'] = '$2';
$route['(\w{2})'] = $route['default_controller'];
/* End of file routes.php */
/* End of file routes.php */
/* Location: ./application/config/routes.php */