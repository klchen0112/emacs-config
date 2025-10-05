{
  description = "THIS IS AN AUTO-GENERATED FILE. PLEASE DON'T EDIT IT MANUALLY.";
  inputs = {
    benchmark-init = {
      flake = false;
      owner = "dholm";
      repo = "benchmark-init-el";
      type = "github";
    };
    ef-themes = {
      flake = false;
      owner = "protesilaos";
      repo = "ef-themes";
      type = "github";
    };
    gcmh = {
      flake = false;
      owner = "koral";
      repo = "gcmh";
      type = "gitlab";
    };
    meow = {
      flake = false;
      owner = "meow-edit";
      repo = "meow";
      type = "github";
    };
    modus-themes = {
      flake = false;
      owner = "protesilaos";
      repo = "modus-themes";
      type = "github";
    };
    setup = {
      flake = false;
      type = "git";
      url = "https://codeberg.org/pkal/setup.el";
    };
  };
  outputs = { ... }: { };
}
