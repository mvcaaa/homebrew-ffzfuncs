class Ffzfuncs < Formula
  desc "Zsh functions for ffmpeg re-encoding with tagging"
  homepage "https://github.com/mvcaaa/ffzfuncs"
  url "https://github.com/mvcaaa/ffzfuncs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8fdc101e2b13db0d34d13541a2a83c42bae73d3cec78ac92b1c4ba67ffc516f3"
  version "0.1.0"

  def install
    (share/"ffzfuncs").install "share/ffzfuncs/ffz.zsh"
  end
end
