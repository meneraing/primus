/* Define which key to use as modifier for keybindings 
 * Example:
 *  Alt key = WLR_MODIFIER_ALT,
 *  Windows key = WLR_MODIFIER_LOGO
 */
#define MODKEY WLR_MODIFIER_LOGO

/* Declare the actions you want to trigger with a keybind here.
 * Follow the example.
 */
static const char *terminal[] = { "kitty", NULL };

/* Here you define the compositor keybindings with the following format: 
 * { modifier, key, function, argument }
 * Note that Shift changes certain key codes: c -> C, 2 -> at, etc.
 */
static const Key keys[] = {
	{ MODKEY, XKB_KEY_Return, spawn, {.v = terminal} },
  { MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_Q, terminate_server, {0} },
};
