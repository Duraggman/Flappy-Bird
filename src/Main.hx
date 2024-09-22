import hxd.Window;
import h2d.Bitmap;
import hxd.Key;
import sys.thread.EventLoop.EventHandler;
import h2d.Tile;
import Utils.Tuple;

class Main extends hxd.App {
    var winH: Int;
    var winW: Int;
    var bgBmp: Bitmap;
    var birdBmp : Bitmap;
    var pipeTBmp : Bitmap;
    var pipeBBmp : Bitmap;
    var window: Window;

    override function init() {
        // initialising hxd.Res
        hxd.Res.initEmbed();
        
        // getting window
        var window = Window.getInstance();
        window.addResizeEvent(winResize);
        // Setting title
        window.title =  "Flappy bird";
        
        // creating the background
        var bg = hxd.Res.fb_BG.toTile();
        winW= window.width;
        winH = window.height;
        bg.scaleToSize(window.width, window.height);

        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        bgBmp = new Bitmap(bg, s2d);
        // modify the display position of the Bitmap sprite
        bgBmp.x = 0;
        bgBmp.y = 0;

        //Creating the bird
        var birdTile = hxd.Res.bird_mid_nbg.toTile();
        birdBmp = new Bitmap(birdTile, s2d);
        
        // setting bird pos
        birdBmp.setPosition(300,400);

        //creating pipes
        var pipeBotTile = hxd.Res.pipeBot.toTile();
        pipeBBmp = new Bitmap(pipeBotTile, s2d);

        pipeBBmp.x = 900;
        pipeBBmp.y = 400;
        

        var pipeTopTile = hxd.Res.pipeTop.toTile();
        pipeTBmp = new Bitmap(pipeTopTile, s2d);
        pipeTBmp.x = 900;
        pipeTBmp.y = 0;
    }
    // on each frame
    override function update(dt:Float) {
        if (!hxd.Key.isPressed(Key.SPACE)){
            birdBmp.setPosition(birdBmp.x, birdBmp.y+1 );
        }
        else{
            birdBmp.setPosition(birdBmp.x, birdBmp.y-15);
        }

        // Move pipes to the left
        pipeBBmp.setPosition(pipeBBmp.x-3,pipeBBmp.y);
        pipeTBmp.setPosition(pipeTBmp.x-3, pipeTBmp.y);
    }

    private function winResize():Void {
        var window = Window.getInstance();
        // Get the current window size
        var width = window.width;
        var height = window.height;

        var maxWidth= 1366;
        var maxHeight = 766;

        // Check and enforce maximum size
        if (width > maxWidth || height > maxHeight) {
            window.resize(maxWidth, maxHeight);
            window.displayMode =Windowed;
        }
    }

    static function main() {
        new Main();
        
    }
}