class Ffzfuncs < Formula
  desc "Zsh functions for ffmpeg re-encoding with tagging"
  homepage "https://github.com/mvcaaa/ffzfuncs"
  url "https://github.com/mvcaaa/ffzfuncs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PUT_YOUR_SHA256_HERE"
  version "0.1.0"

  def install
    (share/"ffzfuncs").install "share/ffzfuncs/ffz.zsh"
  end
end
