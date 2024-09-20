class Main extends hxd.App {
    var bmp : h2d.Bitmap;
    override function init() {
        hxd.Res.initEmbed();
        var bg = hxd.Res.fb_BG_jpeg.toTile();
        bg.scaleToSize(1366, 766);
        // 
        // create a Bitmap object, which will display the tile
        // and will be added to our 2D scene (s2d)
        var bmp = new h2d.Bitmap(bg, s2d);
        // modify the display position of the Bitmap sprite
        bmp.x = 0;
        bmp.y = 0;

        //Creating the bir
        var birdTile = hxd.Res.bird_mid_nbg.toTile();
        var birdBmp = new h2d.Bitmap(birdTile, s2d);
        birdBmp.x = 300;
        birdBmp.y = 400;
    }

    // on each frame
    override function update(dt:Float) {
        // increment the display bitmap rotation by 0.1 radians
        //bmp.rotation += 0.1;
    }

    static function main() {
        new Main();
    }
}