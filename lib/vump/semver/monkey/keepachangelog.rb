require 'keepachangelog'

# Monkey library patch
module Keepachangelog
  # Monkey library patch
  class MarkdownPrinter
    # Add tag prefix
    def anchor(v, i)
      from_v = i == v.length - 1 ? first_commit : 'v' + v[i + 1]
      to_v = Gem::Version.correct?(v[i]) ? 'v' + v[i] : 'HEAD'
      "[#{v[i]}]: #{options[:url]}/compare/#{from_v}...#{to_v}"
    end

    # Add newline after empty section
    def version(header, content)
      chnages = content['changes']
      [
        version_header(header, content['date']),
        chnages.empty? ? '' : chnages.map { |k, v| section(k, v) }
      ]
    end
  end
end
