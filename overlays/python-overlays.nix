self: super: rec {
  python3 = super.python3.override {
    packageOverrides = pyself: pysuper: {
      lsprotocol = pysuper.lsprotocol.overrideAttrs (old: rec {
        version = "2023.0.1";
        src = super.fetchFromGitHub {
          owner = "microsoft";
          repo = "lsprotocol";
          tag = version;
          hash = "sha256-PHjLKazMaT6W4Lve1xNxm6hEwqE3Lr2m5L7Q03fqb68=";
        };
      });
    };
  };

  python3Packages = python3.pkgs;
}
