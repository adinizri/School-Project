var innerWidth = 620,
              innerHeight = 700;
var player = {},

               player_width = 90,
               player_height = 95,
               player_img = new Image();
player_img.src = 'Images/Ship0.png';

//יצירת שחקן
player = {
    width: player_width,
    height: player_height,
    x: (innerWidth / 2) - (player_width / 2),
    y: innerHeight - (player_height + 10),
    power: 5,
    draw: function () {

        if (this.x <= 0) {
            this.x = 0;

        }
        else if (this.x >= (innerWidth - this.width)) {
            this.x = innerWidth - this.width;
        }

        if (this.y <= 0) {
            this.y = 0;

        }
        else if (this.y >= (innerHeight - this.height)) {
            this.y = (innerHeight - this.height);
        }
        c.drawImage(player_img, this.x, this.y, this.width, this.height);
    }


};