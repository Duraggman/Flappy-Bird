import h2d.Bitmap;

class Main extends hxd.App {
    var bmp : h2d.Bitmap;
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
        var birdBmp = new h2d.Bitmap(birdTile, s2d);
        
        // setting bird pos
        birdBmp.x = 300;
        birdBmp.y = 400;

        //creating pipes
        var pipeTile = hxd.Res.pipeBot.toTile();
        var pipeBmp = new Bitmap(pipeTile, s2d);
        pipeBmp.x = 600;
        pipeBmp.y = 500;

        var pipeTile = hxd.Res.pipeTop.toTile();
        var pipeBmp = new Bitmap(pipeTile, s2d);
        pipeBmp.x = 600;
        pipeBmp.y = 0;
    }

    // on each frame
    override function update(dt:Float) {
        // sim gravity
    }

    static function main() {
        new Main();
    }
}