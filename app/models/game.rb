class Game < ApplicationRecord

  belongs_to :user

  serialize :dice, Array
  serialize :roll_result, Hash
  serialize :scorecard, Hash

  def as_json(opts={})
    { id: id.to_i,
      user: user.username.to_s,
      dice: dice.to_a,
      score: score.to_i,
      turnCount: turn_count.to_i,
      rollCount: roll_count.to_i,
      rollResult: roll_result.to_h,
      scorecard: scorecard_with_totals.to_h }
  end

  def roll(dice_to_roll=[])
    return if turn_must_complete || game_over
    dice_to_roll.map!{ |roll_die| roll_die == "true" }
    5.times do |i| # dice.each_with_index do |die, i|
      self.dice[i] = rand(1..6) if dice[i].nil? || dice_to_roll[i]
    end
    increment_roll_count && set_roll_result && save
  end

  def complete_turn(selection)
    # byebug
    return if selection.nil? || game_over || turn_has_not_started || scorecard[selection.to_sym].present?
    self.scorecard[selection.to_sym] = roll_result[selection.to_sym]
    increment_turn_count
    self.roll_count = 0
    self.dice = []
    save
    if game_over
      self.score = total
      save
      user.user_metrics.update
    end
  end

  def increment_roll_count
    self.roll_count = roll_count.to_i + 1
  end

  def increment_turn_count
    self.turn_count = turn_count.to_i + 1
  end

  def scorecard_with_totals
    scorecard.merge(
      'bonus': bonus,
      'total': total
    )
  end

  def subtotal
    scorecard[:ones].to_i +
    scorecard[:twos].to_i +
    scorecard[:threes].to_i +
    scorecard[:fours].to_i +
    scorecard[:fives].to_i +
    scorecard[:sixes].to_i
  end

  def bonus
    subtotal >= 63 ? 35 : 0
  end

  def total
    scorecard.values.sum + bonus
  end

  def set_roll_result
    self.roll_result =
      { 'ones': ones,
        'twos': twos,
        'threes': threes,
        'fours': fours,
        'fives': fives,
        'sixes': sixes,
        'three_of_a_kind': three_of_a_kind,
        'four_of_a_kind': four_of_a_kind,
        'full_house': full_house,
        'small_straight': small_straight,
        'large_straight': large_straight,
        'yahtzee': yahtzee,
        'chance': chance }
  end

  def game_over
    turn_count.to_i > 12
  end

  def turn_must_complete
    roll_count.to_i > 2
  end

  def turn_has_not_started
    roll_count.to_i == 0
  end


  private

  def set_score
    self.score = roll_result.map(&:last).max
  end

  def ones
    sorted_dice.select{ |die| die == 1 }.sum
  end

  def twos
    sorted_dice.select{ |die| die == 2 }.sum
  end

  def threes
    sorted_dice.select{ |die| die == 3 }.sum
  end

  def fours
    sorted_dice.select{ |die| die == 4 }.sum
  end

  def fives
    sorted_dice.select{ |die| die == 5 }.sum
  end

  def sixes
    sorted_dice.select{ |die| die == 6 }.sum
  end

  def three_of_a_kind
    sorted_dice.chunk(&:to_i).map(&:second).map{ |s| ( s.length > 2 ) ? sorted_dice.sum : 0  }.max
  end

  def four_of_a_kind
    sorted_dice.chunk(&:to_i).map(&:second).map{ |s| ( s.length > 3 ) ? sorted_dice.sum : 0  }.max
  end

  def full_house
    result = sorted_dice.chunk(&:to_i).map(&:second).map(&:length).sort == [2,3]
    result ? 25 : 0
  end

  def small_straight
    first_four = sorted_dice.uniq.first(4)
    last_four = sorted_dice.uniq.last(4)
    result =
    ( first_four.length == 4 && ( first_four == (first_four.first..first_four.last).to_a )) ||
    ( last_four.length == 4 && ( last_four == (last_four.last..last_four.last).to_a )) ||
    result ? 30 : 0
  end

  def large_straight
    uniq_dice = sorted_dice.uniq
    result = sorted_dice == (uniq_dice.first..uniq_dice.last).to_a
    result ? 40 : 0
  end

  def yahtzee
    result = sorted_dice.chunk(&:to_i).map(&:second).length == 1
    result ? 50 : 0
  end

  def chance
    sorted_dice.sum
  end

  def sorted_dice
    @sorted_dice ||= dice.sort
  end

end
