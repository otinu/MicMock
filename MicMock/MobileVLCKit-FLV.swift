//
//  MobileVLCKit-FLV.swift
//  MicMock
//
//  Created by Apple on 2024/11/02.
//
 
import SwiftUI
import MobileVLCKit

// ローカルでのエラーは解消したものの、やはりFLVファイルは不発
struct MobileVLCKit_FLV: View {
    @State private var player: VLCMediaPlayer = VLCMediaPlayer()
    
    var body: some View {
        VStack {
            Button(action: {
                playVideo()
            }) {
                Text("Play FLV Video")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .onAppear {
            setupPlayer()
        }
    }
    
    func setupPlayer() {
        // FLVファイルのパスを取得
        guard let videoPath = Bundle.main.path(forResource: "sampleFLV", ofType: "flv") else {
            print("動画ファイルが見つかりません")
            return
        }
        
        // VLCMediaの作成
        // let media = VLCMedia(file: videoPath)
        let media = VLCMedia(path: videoPath)
        player.media = media
    }
    
    func playVideo() {
        player.play()
    }
}

#Preview {
    MobileVLCKit_FLV()
}
