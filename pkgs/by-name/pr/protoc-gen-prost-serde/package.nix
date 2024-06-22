{
  fetchCrate,
  lib,
  rustPlatform,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "protoc-gen-prost-serde";
  version = "0.2.3";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-V2Z6m9y/bBwrr1mgKXKZjVg+LqTe+GalN/AeaICyE64=";
  };

  cargoSha256 = "sha256-l27+Rs4TYIJXZVLj7Tjw8M5+7ivWEY0TXbLtbuzwxLw=";

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Protoc plugin that generates serde serialization implementations for `protoc-gen-prost`";
    mainProgram = "protoc-gen-prost-serde";
    homepage = "https://github.com/neoeinstein/protoc-gen-prost";
    changelog = "https://github.com/neoeinstein/protoc-gen-prost/blob/main/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [
      felschr
      sitaaax
    ];
  };
}
