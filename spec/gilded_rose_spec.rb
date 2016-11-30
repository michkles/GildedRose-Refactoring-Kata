require_relative 'spec_helper'

describe GildedRose do

  let(:foo) { Item.new('foo', 1, 1) }
  let(:items) { [foo]}
  let(:gilded_rose) { GildedRose.new(items)}

  describe "#update_quality" do
    it "does not change the name" do
      expect(items[0].name).to eq "foo"
    end

    it "degrades sell-in and quality value" do
      gilded_rose.update_quality()
      expect(items[0].sell_in && items[0].quality ).to eq 0
    end
  end


end
