class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.9/voiceai-darwin-arm64"
      sha256 "295d823b08706e35c79d56b92ba93eff033c6368934f5b51e20400ac83d43233"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.9/voiceai-darwin-x64"
      sha256 "6e6bda4291054d0ef81db001232ad0eb8d8a2180cf56406cdfb5381675246a26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.9/voiceai-linux-arm64"
      sha256 "dae42ba494c9b125d6963170d86fdac69689cce8e33d01c35276faecb9a688cd"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.9/voiceai-linux-x64"
      sha256 "90addc4fc2de9ed34e919252a38a208ba7f28942e8470623adde2c1ff475a066"
    end
  end

  depends_on "sox" => :recommended  # required for STT mic recording

  def install
    bin.install Dir["voiceai-*"].first => "voiceai"
  end

  def caveats
    <<~EOS
      Config lives at ~/.config/voiceai/ and is NOT removed by `brew uninstall`.
      To wipe it (and the legacy ~/.config/slng/) before uninstalling, run:
        voiceai config reset --force
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voiceai --version")
  end
end
