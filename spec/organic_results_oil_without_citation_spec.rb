describe "Google Organic Results API", type: :request do
	
	describe "Organic Results for Oil without citations" do

    before :all do
      get search_path(engine: "google_scholar", q: "Oil", hl: "en", as_vis: 1)
      @json = response.parsed_body
    end

    it "should return http success" do
      @response.code.should eq "200"
    end

    it "should contain organic results array" do
      @json["organic_results"].should be_an(Array)
    end

    describe "have correct type" do

      before :all do
        @result = @json["organic_results"][0]
      end

      it "should not have citation as type" do
      	@result["type"].should_not eq('Citation')
    	end

    end

	end

end