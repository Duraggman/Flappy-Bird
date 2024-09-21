import hxd.Key;
import sys.thread.EventLoop.EventHandler;

class Main extends hxd.App {
    var birdBmp : h2d.Bitmap;
    var pipeTBmp : h2d.Bitmap;
    var pipeBBmp : h2d.Bitmap;

    override function init() {
        // initialising hxd.Res
        hxd.Res.initEmbed();
        
        // creating the background
        var bg = hxd.Res.fb_BG.toTile();
        bg.scaleToSize(1366, 766);

        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        var bgbmp = new h2d.Bitmap(bg, s2d);
        // modify the display position of the Bitmap sprite
        bgbmp.x = 0;
        bgbmp.y = 0;

        //Creating the bird
        var birdTile = hxd.Res.bird_mid_nbg.toTile();
        birdBmp = new h2d.Bitmap(birdTile, s2d);
        
        // setting bird pos
        birdBmp.setPosition(300,400);

        //creating pipes
        var pipeBotTile = hxd.Res.pipeBot.toTile();
        pipeBBmp = new h2d.Bitmap(pipeBotTile, s2d);
        pipeBBmp.x = 600;
        pipeBBmp.y = 500;

        var pipeTopTile = hxd.Res.pipeTop.toTile();
        pipeTBmp = new h2d.Bitmap(pipeTopTile, s2d);
        pipeTBmp.x = 600;
        pipeTBmp.y = 0;
    }
    // on each frame
    override function update(dt:Float) {
        // sim gravity
        if (!hxd.Key.isPressed(Key.SPACE)){
            birdBmp.setPosition(birdBmp.x, birdBmp.y+0.5);
        }
        else{
            birdBmp.setPosition(birdBmp.x, birdBmp.y-10);
        }

        // Move pipes to the left
        pipeBBmp.setPosition(pipeBBmp.x-1,pipeBBmp.y);
        pipeTBmp.setPosition(pipeTBmp.x-1, pipeTBmp.y);
    }

    static function main() {
        new Main();
    }
}