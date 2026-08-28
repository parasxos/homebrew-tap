class AppleMailMcp < Formula
  include Language::Python::Virtualenv

  desc "Fast local access to Apple Mail: sub-ms search over Mail's own SQLite index, verified sends, MCP server for AI clients"
  homepage "https://github.com/parasxos/apple-mail-mcp"
  url "https://files.pythonhosted.org/packages/71/fc/43ebbe74b72293de459a2816c744f52b153c3a574d08d3b32611ac07cd89/apple_mailbox_mcp-1.5.2.tar.gz"
  sha256 "0dc21e767fe18e8aebb693dbaec9fa50fa65a025feda132016342b9ada993d81"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Grant your terminal Full Disk Access (System Settings > Privacy & Security)
      so the tool can read Mail's Envelope Index, then run:
        apple-mail-mcp setup
    EOS
  end

  test do
    assert_match "apple-mailbox-mcp", shell_output("#{bin}/apple-mail-mcp help")
  end
end
