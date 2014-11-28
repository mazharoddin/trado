require 'rails_helper'

describe StockHelper do

    describe '#latest_stock_adjustment' do
        let!(:sku) { create(:sku, active: true) }
        let!(:stock_adjustment) { create(:stock_adjustment, sku_id: sku.id) }
        
        context "if the stock adjustment is equal to the latest SKU stock adjustment record" do

            it "should return a string" do
                expect(latest_stock_adjustment(sku.stock_adjustments.active.first, sku)).to eq 'td-green'
            end
        end
        context "if the stock adjustment is not equal to the latest SKU stock adjustment record" do

            it "should return nil" do
                expect(latest_stock_adjustment(sku.stock_adjustments.active.last, sku)).to eq nil
            end
        end
    end
end