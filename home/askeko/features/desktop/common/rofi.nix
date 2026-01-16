#
# Menu launcher, now working for both Wayland and X11
#
{ config, ... }:
let
  # Use `mkLiteral` for string-like values that should show without
  # quotes, e.g.:
  # {
  #   foo = "abc"; => foo: "abc";
  #   bar = mkLiteral "abc"; => bar: abc;
  # };
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs = {
    rofi = {
      enable = true;
      theme = {
        "*" = {
          font = "FiraCode Nerd Font Mono 12";

          foreground = mkLiteral "#D3C6AA";
          background-color = mkLiteral "#2D353B";
          active-background = mkLiteral "#7FBBB3";
          active-foreground = mkLiteral "#2D353B";
          urgent-background = mkLiteral "#E67E80";
          urgent-foreground = mkLiteral "#2D353B";

          selected-background = mkLiteral "@active-background";
          selected-foreground = mkLiteral "@active-foreground";
          selected-urgent-background = mkLiteral "@urgent-background";
          selected-active-background = mkLiteral "@active-background";
          separatorcolor = mkLiteral "@active-background";
          bordercolor = mkLiteral "#7FBBB3";
          cyan = mkLiteral "#83C092";
          green = mkLiteral "#A7C080";
          purple = mkLiteral "#D699B6";
        };

        "#window" = {
          background-color = mkLiteral "@background-color";
          border = 3;
          border-radius = 6;
          border-color = mkLiteral "@bordercolor";
          padding = 15;
        };
        "#mainbox" = {
          border = 0;
          padding = 0;
        };
        "#message" = {
          border = mkLiteral "0px";
          border-color = mkLiteral "@separatorcolor";
          padding = mkLiteral "1px";
        };
        "#textbox" = {
          text-color = mkLiteral "@foreground";
        };
        "#listview" = {
          fixed-height = 0;
          border = mkLiteral "0px";
          border-color = mkLiteral "@bordercolor";
          spacing = mkLiteral "2px";
          scrollbar = false;
          padding = mkLiteral "2px 0px 0px";
        };
        "#element" = {
          border = 0;
          padding = mkLiteral "3px";
        };
        "#element.normal.normal" = {
          background-color = mkLiteral "@background-color";
          text-color = mkLiteral "@foreground";
        };
        "#element.normal.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@urgent-foreground";
        };
        "#element.normal.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@background-color";
        };
        "#element.selected.normal" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@selected-foreground";
        };
        "#element.selected.urgent" = {
          background-color = mkLiteral "@selected-urgent-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.selected.active" = {
          background-color = mkLiteral "@selected-active-background";
          text-color = mkLiteral "@background-color";
        };
        "#element.alternate.normal" = {
          background-color = mkLiteral "@background-color";
          text-color = mkLiteral "@foreground";
        };
        "#element.alternate.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@foreground";
        };
        "#element.alternate.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@foreground";
        };
        "#scrollbar" = {
          width = mkLiteral "2px";
          border = 0;
          handle-width = mkLiteral "8px";
          padding = 0;
        };
        "#sidebar" = {
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
        };
        "#button.selected" = {
          background-color = mkLiteral "@selected-background";
          text-color = mkLiteral "@selected-foreground";
        };
        "#inputbar" = {
          spacing = 0;
          text-color = mkLiteral "@foreground";
          padding = mkLiteral "1px";
          children = mkLiteral "[ prompt,textbox-prompt-colon,entry,case-indicator ]";
        };
        "#case-indicator" = {
          spacing = 0;
          text-color = mkLiteral "@foreground";
        };
        "#entry" = {
          spacing = 0;
          text-color = mkLiteral "@cyan";
        };
        "#prompt" = {
          spacing = 0;
          text-color = mkLiteral "@green";
        };
        "#textbox-prompt-colon" = {
          expand = false;
          str = ">";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@purple";
        };
        "element-text, element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
      };
    };
  };
}
