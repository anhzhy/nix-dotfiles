{
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];

  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "${username}" ];
}
