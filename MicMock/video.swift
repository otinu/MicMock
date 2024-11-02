//
//  video.swift
//  MicMock
//
//  Created by Apple on 2024/11/02.
//

import SwiftUI
import AVKit

// videoPlayerでの再生方法
// →FLVファイルでの再生は不可だった
// →また、アセットカタログから取り出す方法は検証してない

struct video: View {
    @State private var isPlaying = false

        var body: some View {
            VStack {
                Button(action: {
                    isPlaying.toggle()
                }) {
                    Text(isPlaying ? "Stop Video" : "Play Video")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .fullScreenCover(isPresented: $isPlaying) {
                    VideoPlayerView()
                }
            }
            .padding()
        }
    }

    struct VideoPlayerView: View {
        var body: some View {
            // アセットから動画を取得
            if let videoURL = Bundle.main.url(forResource: "sampleMP4", withExtension: "mp4") {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("動画ファイルが見つかりません")
            }
        }
    }

#Preview {
    video()
}
