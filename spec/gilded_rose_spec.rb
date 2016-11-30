require_relative 'spec_helper'

describe GildedRose do

  let(:foo)  { Item.new('foo', 1, 0) }        #0
  let(:brie) { Item.new('Aged Brie', 10, 10)} #1
  let(:sword) { Item.new('Sword', 1, 0)}      #2
  let(:brie2) { Item.new('Aged Brie', 10, 50)}#3
  let(:items) { [foo, brie, sword, brie2] }
  let(:gilded_rose) { GildedRose.new(items) }

  describe "#update_quality" do
    it "does not change the name" do
      expect(items[0].name).to eq "foo"
    end

    it "degrades sell-in and quality value" do
      gilded_rose.update_quality()
      expect(items[0].sell_in && items[0].quality ).to eq 0
    end

    it "is not possible to have quality of an item below 0" do
      gilded_rose.update_quality()
      expect(items[2].quality).to eq 0
    end

    context "#updated item is Brie" do
      it "quality is increasing" do
        gilded_rose.update_quality()
        expect(items[1].quality).to eq 11
      end

      it "it is not possible to have quality of an item above 50" do
        gilded_rose.update_quality()
        expect(items[3].quality).to eq 50
      end
    end
  end

end
