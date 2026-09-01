class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.16/voiceai-darwin-arm64"
      sha256 "b9d453c3ec78c8340fa9d7115e31423e8a3f9334b545bc9592dd868cac4e59dd"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.16/voiceai-darwin-x64"
      sha256 "358c700b06109d32eeac8f4f09d01bd38431e166597dad1566fba81d38fdff5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.16/voiceai-linux-arm64"
      sha256 "d05afabdb105b6a5d5edc921d67422a3f42f23a9946863eec5ef8d3ba73e413d"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.16/voiceai-linux-x64"
      sha256 "a1eddffcec2ead211f6f568d956b4d7ac7f6ffe8217362d16d9d406c0e5260aa"
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
