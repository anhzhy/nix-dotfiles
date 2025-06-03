{ ... }:
{
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.hyprlock = { };

  environment.etc = {
    "polkit-1/rules.d/99-gamemode.rules" = {
      text = ''
        polkit.addRule(function(action, subject) {
          if (action.id == "com.feralinteractive.GameMode") {
            return polkit.Result.YES;
          }
        });
      '';
    };
  };
}
