class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show 
        set_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
            if @song.valid?
                @song.save
                redirect_to song_path(@song)
            else
                render :new
            end
    end

    def edit
        set_song
    end

    def update 
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    private
    def set_song
        @song = Song.find_by_id(params[:id])
    end

    def song_params
        params.permit(:title, :released, :release_year, :artist_name, :genre)
    end
end