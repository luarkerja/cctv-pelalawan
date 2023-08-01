"use client";

import { useRef, useEffect } from "react";
import Link from "next/link";
import videojs from "video.js";
import "video.js/dist/video-js.css";

export default function IndexPage() {
  const videoRef = useRef(null);

  useEffect(() => {
    if (videoRef.current) {
      videojs(videoRef.current, {
        sources: [
          {
            src: "https://rtmp.pekanbaru.go.id/cctv-kota/cctv-1217.m3u8",
            type: "application/x-mpegURL",
          },
        ],
      });
    }
  });

  return (
    <div>
      <div className="container mx-auto px-4">
        <div>CCTV Pelalawan</div>
        <div className="cctv-content">
          <video controls ref={videoRef} className="video-js w-96" />
        </div>
      </div>
    </div>
  );
}
