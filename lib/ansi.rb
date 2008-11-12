# based on http://en.wikipedia.org/wiki/ANSI_escape_code
# Written by Steven Soroka
module ANSI
  class <<self
    COLORS = {:black => 0, :red => 1, :green => 2, :yellow => 3, :blue => 4, :magenta => 5, :purple => 5,
      :cyan => 6, :light_blue => 6, :lt_blue => 6, :white => 7}

    # Some of these are not widely supported, like italics, underline, blink_fast, etc.
    COLOR_OPTIONS = {:normal => 0, :bold => 1, :faint => 2, :italics => 3, :underline => 4, :blink => 5,
      :blink_slow => 5, :blink_fast => 6, :double_underline => 21, :no_underline => 24, :no_blink => 25}

    def back(count = 79)
      esc_code("#{count}D")
    end
    alias_method :left, :back

    def forward(count = 1)
      esc_code("#{count}C")
    end
    alias_method :right, :forward

    def up(count = 1)
      esc_code("#{count}A")
    end

    def down(count = 1)
      esc_code("#{count}B")
    end

    def color(color, options = {}, &block)
      r = set_color(color, options.merge(:base => options[:bright] ? 90 : 30))
      if block_given?
        r += yield
        r += no_color
      end
      r
    end

    def bg_color(color, options = {}, &block)
      r = set_color(color, options.merge(:base => options[:bright] ? 100 : 40))
      if block_given?
        r += yield
        r += no_color
      end
      r
    end

    def no_color
      esc_code('m')
    end

    def clear_line(left_right_or_all = :right)
      opt = {:left => 1, :right => 0, :line => 2, :all => 2}[left_right_or_all]
      esc_code("#{opt}K")
    end
    alias_method :clear, :clear_line # maybe clear should be its own method that can clear the screen, too.

    def hide_cursor(&blk)
      out = esc_code("?25l")
      out << (yield + show_cursor) if block_given?
      out
    end

    def show_cursor
      esc_code("?25h")
    end

    def save_position
      esc_code("s")
    end

    def restore_position
      esc_code("u")
    end

    def clear_screen(top_or_bottom_or_all = :all)
      opt = {:top => 1, :bottom => 0, :all => 2}[top_or_bottom_or_all]
      esc_code("#{opt}J")
    end
    private
      def set_color(color, options)
        raise Exception.new("Invalid color") unless COLORS.keys.include?(color)
        opts = [COLORS[color] + options[:base]]
        COLOR_OPTIONS.each{|k,v|
          opts << v if options[k]
        }
        esc_code("#{opts.join(';')}m")
      end

      def esc_code(s)
        "#{esc}#{s}" #.wrap('\[', '\]') # this wrap was supposed to avoid messing up wrapping long lines. maybe not needed.
      end

      def esc
        "\033["
      end
  end
end