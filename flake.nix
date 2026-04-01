{
  description = "My collection of Nix flake templates";

  outputs = { self }: {

    templates = {
      comppro = {
        path = ./comppro;
        description = "Competitive Programming";
      };

      crf = {
        path = ./ctf;
        description = "CTF";
      };
    };
  };
}
