#数据预处理
python data/create_dataset.py --videos_folder /input0/original_high_fps_videos --dataset_folder custom_dataset/

#测试
#python video_to_slomo.py --ffmpeg ./  --video ../input/output_20s.mp4 --sf 4 --checkpoint ../SuperSloMo.ckpt --fps 25 --output /output/output/out_x4.mkv
#裁剪视频
#ffmpeg -ss 00:00:00 -t 00:00:20 -i test.mp4 -vcodec copy -acodec copy output_10s.mp4

#多卡训练
horovodrun -np 2 -H localhost:2  python train.py --dataset_root custom_data/ --checkpoint_dir /output/tf_dir --distributed True --epochs 100 --train_batch_size 12 --validation_batch_size 20 --init_learning_rate 0.0002  --progress_iter 50 --milestones 50 75

#单卡训练
python train.py --dataset_root custom_dataset --checkpoint_dir /output/tf_dir
