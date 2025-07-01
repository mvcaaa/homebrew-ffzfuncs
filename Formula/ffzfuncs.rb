class Ffzfuncs < Formula
  desc "Zsh functions for ffmpeg re-encoding with tagging"
  homepage "https://github.com/mvcaaa/ffzfuncs"
  url "https://github.com/mvcaaa/ffzfuncs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7d67567739d2fc9893e05343e6818f0a46c8c13502d6c434a785966dd6f71430"
  version "0.1.0"

  def install
    (share/"ffzfuncs").install "share/ffzfuncs/ffz.zsh"
  end
end
