class Ffzfuncs < Formula
  desc "Zsh functions for ffmpeg re-encoding with tagging"
  homepage "https://github.com/mvcaaa/ffzfuncs"
  url "https://github.com/mvcaaa/ffzfuncs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4860de6fa77602a9f00a9b7374d4dd61b7840b279d75aca8f9a33b56d6770027"
  version "0.1.0"

  def install
    (share/"ffzfuncs").install "share/ffzfuncs/ffz.zsh"
  end
end
