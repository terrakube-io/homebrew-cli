#!/bin/bash
# Build Homebrew bottle files for the terrakube formula.
# After running this script, upload the generated .bottle.tar.gz files
# to a GitHub release at:
#   https://github.com/terrakube-io/homebrew-cli/releases/tag/v${VERSION}
#
# Then update Formula/terrakube.rb with the printed SHA256 values.
#
# Usage: ./build_bottles.sh [VERSION]
#   VERSION defaults to 1.0.0-beta.5

set -euo pipefail

VERSION="${1:-1.0.0-beta.5}"
FORMULA_NAME="terrakube"
WORKDIR=$(mktemp -d)
OUTDIR="$(pwd)/bottles"

mkdir -p "$OUTDIR"

# Platform -> Homebrew bottle tag mapping
declare -A TAGS=(
  ["darwin-amd64"]="big_sur"
  ["darwin-arm64"]="arm64_big_sur"
  ["linux-amd64"]="x86_64_linux"
  ["linux-arm64"]="aarch64_linux"
)

echo "Building bottles for ${FORMULA_NAME} v${VERSION}..."
echo ""

for PLATFORM in "${!TAGS[@]}"; do
  TAG="${TAGS[$PLATFORM]}"
  ARCHIVE_URL="https://github.com/terrakube-io/terrakube-cli/releases/download/v${VERSION}/terrakube-v${VERSION}-${PLATFORM}.tar.gz"
  BOTTLE_FILE="${FORMULA_NAME}-${VERSION}.${TAG}.bottle.tar.gz"

  echo "==> ${PLATFORM} (${TAG})"

  # Download and extract the binary
  STAGING="${WORKDIR}/${PLATFORM}"
  mkdir -p "${STAGING}/${FORMULA_NAME}/${VERSION}/bin"
  curl -sL "$ARCHIVE_URL" | tar xz -C "${STAGING}/"
  mv "${STAGING}/terrakube" "${STAGING}/${FORMULA_NAME}/${VERSION}/bin/"

  # Create the bottle tar.gz
  (cd "${STAGING}" && tar czf "${OUTDIR}/${BOTTLE_FILE}" "${FORMULA_NAME}")

  SHA=$(sha256sum "${OUTDIR}/${BOTTLE_FILE}" | cut -d' ' -f1)
  echo "    sha256 cellar: :any_skip_relocation, ${TAG}: \"${SHA}\""
  echo ""
done

rm -rf "$WORKDIR"

echo "==> Bottles written to ${OUTDIR}/"
echo ""
echo "Upload these files to a GitHub release tagged v${VERSION} on the homebrew-cli repo,"
echo "then update the bottle do block in Formula/terrakube.rb with the SHA256 values above."
