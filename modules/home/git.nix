{ user, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = user.fullName;
        email = user.email;
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      advice.addIgnoredFile = false;
    };
    signing.key = user.gpgKey;
    ignores = [
      "CLAUDE.md"
    ];
  };
}
