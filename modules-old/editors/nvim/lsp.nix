{...}: {
  programs.nvf.settings.vim = {
    treesitter = {
      enable = true;
      context.enable = true;
      fold = false;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      lspkind.enable = true;

      mappings = {
        # Actions
        codeAction = "<leader>ca";
        renameSymbol = "<leader>rn";
        # Goto
        goToDeclaration = "gD";
        goToDefinition = "gd";
        goToType = "gt";
        listImplementations = "gi";
        listReferences = "gr";
        # Diagnostics
        openDiagnosticFloat = "<leader>k";
        nextDiagnostic = "<leader>dn";
        previousDiagnostic = "<leader>dn";
        # Info
        hover = "K";
        signatureHelp = "<leader>K";
      };
    };

    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableLSP = true;
      enableTreesitter = true;

      # Languages
      bash.enable = true;
      css.enable = true;
      emmet.enable = true;
      haskell.enable = true;
      helm.enable = true;
      html.enable = true;
      nix.enable = true;
      python.enable = true;
      rust = {
        enable = true;
        crates.enable = true;
      };
      tailwind.enable = true;
      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      typst = {
        enable = true;
        format.enable = false;
      };
      yaml.enable = true;
    };
  };
}
