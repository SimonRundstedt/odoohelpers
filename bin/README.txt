# Tested

Manually tested to perform the action intended the way it originally did.


000_empty_template.sh
odooaddons              Tested - Doesn't add default location to addons. Expected. Does it have any effect on anything ? Installation pass smoke test.
odooadminpw             Tested - Basic functionality. Add a set pwd?
odooalldbs              Tested
odoolistdbs             Tested (forgot about alldbs for a second)
odoocreatetestdb        Note: Script assumes odoo has a proper login shell. Change su odoo to sudo (root)? Possibly with code setting permissions and owner.
odooeditlog             Tested
odoofind                Tested - Not very useful ? Replace with a odoofind (emphasis find) and odoogrep?
odoogitclone            Tested - Match old behavior. Creates target folder before attempting to clone the repo
odoogitlistbranch       Tested - Tested
odoogitpull             Tested - Match old behavior. Change default stderr output location?
odoolangexport
odoolistprojects        Tested - Maybe print on different lines?
odoomodulecheck
odoomoduleinstall
odoomodulesprint        Tested - Result: Print extra modules, not core. Note: Python script. Doesn't yet load odoo.tools. Note: Need to be run as root. Solution: Make wrapper script and export variables in odoo.tools
odoopatch               Deprecate? When did anyone patch with patch files last time?
odoorestart             Tested
odoosetperm             Tested - Does what it says on the tin. Doesn't touch odoo core.
odoosync                Tested* - Changed code. Need retesting
odoosyncall             Tested* - --||-- , .gitignore is transferred too.
odootail                Tested
odooupd.py              Tested - Light smoke test passed. Note: Requires root. Doesn't call sudo internally. Note: Many other commands depend on this script. Note: Some functionality is covered by other commands. Eg: PASSWD command which can be changed to odooadminpw
odooupdm                Tested - Extra checks works. Get some Odoo error when running the meaty part, even manually
