
//测试
python video_to_slomo.py --ffmpeg ./  --video ../input/output_20s.mp4 --sf 4 --checkpoint ../SuperSloMo.ckpt --fps 25 --output /output/output/out_x4.mkv
//裁剪视频
ffmpeg -ss 00:00:00 -t 00:00:20 -i test.mp4 -vcodec copy -acodec copy output_10s.mp4


