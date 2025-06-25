{ ... }:
{
  programs.vscode.profiles.default = {
    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" = "'Maple Mono', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'Maple Mono', 'SymbolsNerdFont'";
      "editor.fontSize" = 18;
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "workbench.iconTheme" = "gruvbox-material-icon-theme";
      "material-icon-theme.folders.theme" = "classic";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;
      "editor.inlayHints.enabled" = "off";

      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 10;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "multiple";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 1;
      "breadcrumbs.enabled" = false;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "top";
      "workbench.statusBar.visible" = false;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = false;
      "editor.mouseWheelZoom" = true;

      # C/C++
      "clangd.arguments" = [
        "--clang-tidy"
        "--inlay-hints=false"
      ];

      # Rust
      "rust-analyzer.server.path" = "rust-analyzer";
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.cargo.loadOutDirsFromCheck" = true;
      "rust-analyzer.procMacro.enable" = true;
      "rust-analyzer.diagnostics.disabled" = [ "unresolved-proc-macro" ];

      # Python
      "python.languageServer" = "Pylance";
      "python.analysis.typeCheckingMode" = "basic";
      "python.testing.pytestEnabled" = true;
      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };
      "python.formatting.provider" = "black";
      "python.linting.enabled" = true;
      "python.linting.pylintEnabled" = true;

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "[nix]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };

      # Node.js / TypeScript / React
      "eslint.enable" = true;
      "eslint.run" = "onType";
      "eslint.validate" = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];
      "prettier.requireConfig" = true;
      "typescript.tsserver.experimental.enableProjectDiagnostics" = true;

      # PHP
      "php.validate.enable" = true;
      "php.suggest.basic" = false;
      "intelephense.files.maxSize" = 5000000;
      "intelephense.environment.includePaths" = [
        "/usr/include/php"
        "/usr/local/include/php"
      ];

      # General
      "files.exclude" = {
        "**/.git" = true;
        "**/.DS_Store" = true;
        "**/node_modules" = true;
      };
    };
  };
}
