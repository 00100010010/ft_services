<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
 define('AUTH_KEY',         'wtJBbUVq+nn?~MWGv/$?fP(OTK7a6^q-VjAE:N8@kJV~F |!;f8Dh/@~`hx+|-+~');
 define('SECURE_AUTH_KEY',  'iEoT7nUGo|7d*Pccj,?dLc`26Rt<S4jcvi?3Cd#TaC+16{6+4LI9hr--uXDMB/F8');
 define('LOGGED_IN_KEY',    'gb>[pI-S|:)xVRqN*yKcgl6PA|x5Jvdv)LR9u%7MmP`|Tr0X~q|cp+uKsY0. &R%');
 define('NONCE_KEY',        'CEhRb=rm=mij`LLCIwqc^nXln{mh-X8XVZO&auet_0/n~Ie|<O1]Gmu&^/iH*jHy');
 define('AUTH_SALT',        '5sKQ_]knn!DJ<=<nv}-QD1Q|HE!P(`*URE3(F9IGGsH81E!N7dQ*ub2u/iowmn72');
 define('SECURE_AUTH_SALT', 'b&!v,xr,Q(e9f*}#o0kpf*:$uzHg(@jv$7AoiCIHDx?R#}sXGkQ%ZwgNKzU@@+Qb');
 define('LOGGED_IN_SALT',   'r_H42G.]1pEVJN|C+-Miu`1ZW)=;Xsdj%3]x#.zaxBs`tLc[g6W+sibTre<(Ax?5');
 define('NONCE_SALT',       'ax?^f|*#8-X]%&)qlb@zkld uf.`bA9d2]_}Zja:$(r89E<2xgr/x6aa&6{eQG$:');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
