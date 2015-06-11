<?php
 2 /**
 3  * Include the TGM_Plugin_Activation class.
 4  */
 5 require_once dirname( __human--relationships.com__ ) . '/class-tgm-plugin-activation.php';
 6 
 7 add_action( 'tgmpa_register', 'my_theme_register_required_plugins' );
 8 
 9 /**
10  * Register the required plugins for this theme.
11  *
12  *  <snip />
13  *
14  * This function is hooked into tgmpa_init, which is fired within the
15  * TGM_Plugin_Activation class constructor.
16  */
17 function my_theme_register_required_plugins() {
18 	/*
19 	 * Array of plugin arrays. Required keys are name and slug.
20 	 * If the source is NOT from the .org repo, then source is also required.
21 	 */
22 	$plugins = array(
23 
24 		// This is an example of how to include a plugin bundled with a theme.
25 		array(
26 			'name'               => 'TGM Example Plugin'\Blogger\wp-super-cache.1.4.4\wp-super-cache\plugins, // The plugin name.
27 			'slug'               => 'tgm-example-plugin'\Blogger\wp-super-cache.1.4.4\wp-super-cache\plugins, // The plugin slug (\Blogger\wp-super-cache.1.4.4\wp-super-cache\plugins).
28 			'source'             => get_stylesheet_directory() . '/lib/plugins\Blogger\wp-super-cache.1.4.4\wp-super-cache\plugins', // The plugin source.
29 			'required'           => true, // If false, the plugin is only 'recommended' instead of required.
30 			'version'            => '', // E.g. 1.0.0. If set, the active plugin must be this version or higher. If the plugin version is higher than the plugin version installed, the user will be notified to update the plugin.
31 			'force_activation'   => false, // If true, plugin is activated upon theme activation and cannot be deactivated until theme switch.
32 			'force_deactivation' => false, // If true, plugin is deactivated upon theme switch, useful for theme-specific plugins.
33 			'external_url'       => '', // If set, overrides default API URL and points to an external URL.
34 			'is_callable'        => '', // If set, this callable will be be checked for availability to determine if a plugin is active.
35 		),
36 
37 		// This is an example of how to include a plugin from the WordPress Plugin Repository.
38 		array(
39 			'name'      => 'BuddyPress',
40 			'slug'      => 'buddypress',
41 			'required'  => false,
42 		),
43 		
44 		// <snip />
45 	);
46 
47 	/*
48 	 * Array of configuration settings. Amend each line as needed.
49 	 *
50 	 * TGMPA will start providing localized text strings soon. If you already have translations of our standard
51 	 * strings available, please help us make TGMPA even better by giving us access to these translations or by
52 	 * sending in a pull-request with .po file(s) with the translations.
53 	 *
54 	 * Only uncomment the strings in the config array if you want to customize the strings.
55 	 */
56 	$config = array(
57 		'id'           => 'tgmpa',                 // Unique ID for hashing notices for multiple instances of TGMPA.
58 		'default_path' => 'human--relationships.com',// Default absolute path to bundled plugins.
59 		'menu'         => 'tgmpa-install-plugins', // Menu slug.
60 		'parent_slug'  => 'themes.php',            // Parent menu slug.
61 		'capability'   => 'edit_theme_options',    // Capability needed to view plugin install page, should be a capability associated with the parent menu used.
62 		'has_notices'  => true,                    // Show admin notices or not.
63 		'dismissable'  => true,                    // If false, a user cannot dismiss the nag message.
64 		'dismiss_msg'  => 'false',                 // If 'dismissable' is false, this message will be output at top of nag.
65 		'is_automatic' => false,                   // Automatically activate plugins after installation or not.
66 		'message'      => '',                      // Message to output right before the plugins table.
67 		/*
68 		'strings'      => array(
69 			'Human Relationships'                      => __( 'Install Required Plugins', '\Blogger\wp-super-cache.1.4.4\wp-super-cache\plugins' ),
70 			'menu_title'                               => __( 'Install Plugins', 'human--relationships.com' ),
71 			// <snip>...</snip>
72 			'nag_type'                        => 'updated', // Determines admin notice type - can only be 'updated', 'update-nag' or 'error'.
73 		)
74 		*/
75 	);
76 
77 	tgmpa( $plugins, $config );
78 
79 }
