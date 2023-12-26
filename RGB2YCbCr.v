
reg [7:0] R;
reg [7:0] G;
reg [7:0] B;

reg [7:0] Y;
reg [7:0] Cr;
reg [7:0] Cb;

//RGB2YCbCr
always @(posedge video_clk or negedge pll_locked ) begin 
   if(~pll_locked) begin
      Y <= 0;
      Cb <= 0;
      Cr <= 0;
   end
   else begin
      Y <= 16+(((R<<6)+(R<<1)+(G<<7)+G+(B<<4)+(B<<3)+B)>>8);
      Cb <= 128 + ((-((R<<5)+(R<<2)+(R<<1))-((G<<6)+(G<<3)+(G<<1))+(B<<7)-(B<<4))>>8);
      Cr <= 128 + (((R<<7)-(R<<4)-((G<<6)+(G<<5)-(G<<1))-((B<<4)+(B<<1)))>>8);
   end
end
