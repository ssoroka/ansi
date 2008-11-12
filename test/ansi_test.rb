require 'test/unit'
require File.dirname(__FILE__)+'/../lib/ansi'

class Ansi < Test::Unit::TestCase
  def test_ansi_should_know_how_to_move_left
    assert_equal ANSI.left(3), "\033[3D"
  end

  def test_ansi_should_know_how_to_move_right
    assert_equal ANSI.right(3), "\033[3C"
  end

  def test_ansi_should_know_how_to_move_up
    assert_equal ANSI.up(3), "\033[3A"
  end

  def test_ansi_should_know_how_to_move_down
    assert_equal ANSI.down(3), "\033[3B"
  end

  def test_ansi_should_know_how_to_turn_color_off
    assert_equal ANSI.no_color, "\033[m"
  end

  def test_ansi_should_clear_text_to_the_right
    assert_equal ANSI.clear(:right), "\033[0K"
  end

  def test_ansi_should_clear_text_to_the_left
    assert_equal ANSI.clear(:left), "\033[1K"
  end

  def test_ansi_should_clear_the_line
    assert_equal ANSI.clear(:line), "\033[2K"
  end

  def test_ansi_should_hide_cursor
    assert_equal ANSI.hide_cursor, "\033[?25l"
  end

  def test_ansi_should_show_cursor
    assert_equal ANSI.show_cursor, "\033[?25h"
  end

  def test_ansi_color_should_display_blue
    assert_equal ANSI.color(:blue), "\033[34m"
  end

  def test_ansi_color_should_blink
    assert_equal ANSI.color(:black, :blink => true), "\033[30;5m"
  end

  def test_ansi_color_should_display_background_color
    assert_equal ANSI.bg_color(:blue), "\033[44m"
  end

  def test_ansi_color_should_clear_the_screen
    assert_equal ANSI.clear_screen(:all), "\033[2J"
  end

  def test_ansi_color_should_save_cursor_position
    assert_equal ANSI.save_position, "\033[s"
  end

  def test_ansi_color_should_restore_cursor_position
    assert_equal ANSI.restore_position, "\033[u"
  end
end
