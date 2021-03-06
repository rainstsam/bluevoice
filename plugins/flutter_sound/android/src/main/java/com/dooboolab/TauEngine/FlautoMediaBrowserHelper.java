package com.dooboolab.TauEngine;
/*
 * Copyright 2018, 2019, 2020, 2021 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the Mozilla Public License version 2 (MPL2.0),
 * as published by the Mozilla organization.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MPL General Public License for more details.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import android.content.ComponentName;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.session.MediaControllerCompat;


import androidx.arch.core.util.Function;

import java.util.concurrent.Callable;

public class FlautoMediaBrowserHelper
{
	FlautoPlayerCallback m_callback;
	MediaControllerCompat mediaControllerCompat;
	private MediaBrowserCompat mMediaBrowserCompat;
	// The function to call when the media browser successfully connects
	// to the service.
	private Callable<Void>     mServiceConnectionSuccessCallback;
	// The function to call when the media browser is unable to connect
	// to the service.
	private Callable<Void>     mServiceConnectionUnsuccessfulCallback;

	//private BackgroundAudioService backgroundAudioService ;

	private MediaBrowserCompat.ConnectionCallback mMediaBrowserCompatConnectionCallback = new MediaBrowserCompat.ConnectionCallback()
	{
		@Override
		public void onConnected()
		{
			super.onConnected();
			// A new MediaBrowserCompat object is created and connected. Then, initialize a
			// MediaControllerCompat object and associate it with MediaSessionCompat. Once
			// completed,
			// start the audio playback.
			try
			{
				if (Flauto.androidActivity == null)
					throw new RuntimeException();
				mediaControllerCompat = new MediaControllerCompat( Flauto.androidActivity, mMediaBrowserCompat.getSessionToken() );
				MediaControllerCompat.setMediaController( Flauto.androidActivity, mediaControllerCompat );

				// Start the audio playback
				// MediaControllerCompat.getMediaController(mActivity).getTransportControls().playFromMediaId("http://path-to-audio-file.com",
				// null);

			}
			catch ( Exception e )
			{
				m_callback.log(Flauto.t_LOG_LEVEL.ERROR,  "The following error occurred while" + " initializing the media controller.");
			}

			// Call the successful connection callback if it was provided
			if ( mServiceConnectionSuccessCallback != null )
			{
				try
				{
					mServiceConnectionSuccessCallback.call();
					// Remove the callback
					mServiceConnectionSuccessCallback = null;
				}
				catch ( Exception e )
				{
					e.printStackTrace();
				}
			}
		}

		@Override
		public void onConnectionFailed()
		{
			super.onConnectionFailed();

			// Call the unsuccessful connection callback if it was provided
			if ( mServiceConnectionUnsuccessfulCallback != null )
			{
				try
				{
					mServiceConnectionUnsuccessfulCallback.call();
					// Remove the callback
					mServiceConnectionUnsuccessfulCallback = null;
				}
				catch ( Exception e )
				{
					e.printStackTrace();
				}
			}
		}
	};

	/**
	 * Initialize the media browser helper.
	 *
	 * @param serviceSuccessConnectionCallback   The callback to call when the
	 *                                        connection is successful.
	 * @param serviceUnsuccConnectionCallback The callback to call when the
	 *                                        connection is unsuccessful.
	 */
	/* ctor */ FlautoMediaBrowserHelper(
		 Callable<Void> serviceSuccessConnectionCallback, Callable<Void> serviceUnsuccConnectionCallback,
		 FlautoPlayerCallback cb)
	{
		m_callback = cb;
		mServiceConnectionSuccessCallback      = serviceSuccessConnectionCallback;
		mServiceConnectionUnsuccessfulCallback = serviceUnsuccConnectionCallback;
		initMediaBrowser();
	}

	/**
	 * Initialize the media browser in this class
	 */
	private void initMediaBrowser()
	{
		if (Flauto.androidActivity == null)
			throw new RuntimeException();
		// Create and connect a MediaBrowserCompat
		mMediaBrowserCompat = new MediaBrowserCompat
		(
			Flauto.androidActivity,
			new ComponentName( Flauto.androidActivity, FlautoBackgroundAudioService.class ),
			mMediaBrowserCompatConnectionCallback,
			Flauto.androidActivity.getIntent().getExtras()
		);


		mMediaBrowserCompat.connect();
	}

	/**
	 * Clean up the resources taken by the media browser.
	 * <p>
	 * Call this in onDestroy().
	 */
	void releaseMediaBrowser()
	{
		mMediaBrowserCompat.disconnect();
	}

	void playPlayback()
	{
		FlautoBackgroundAudioService.pauseResumeCalledByApp = true;
		mediaControllerCompat.getTransportControls().play();
	}

	void pausePlayback()
	{
		FlautoBackgroundAudioService.pauseResumeCalledByApp = true;
		mediaControllerCompat.getTransportControls().pause();
	}

	void resumePlayback()
	{
		FlautoBackgroundAudioService.pauseResumeCalledByApp = true;
		mediaControllerCompat.getTransportControls().play();
	}


	void seekTo( long newPosition )
	{
		mediaControllerCompat.getTransportControls().seekTo( newPosition );
	}

	void stop()
	{
		mediaControllerCompat.getTransportControls().stop();
	}

	void setMediaPlayerOnPreparedListener( Callable<Void> callback )
	{
		FlautoBackgroundAudioService.mediaPlayerOnPreparedListener = callback;
	}

	void setMediaPlayerOnCompletionListener( Callable<Void> callback )
	{
		FlautoBackgroundAudioService.mediaPlayerOnCompletionListener = callback;
	}

	/**
	 * Add a handler for when the user taps the button to skip the track forward.
	 */
	void setSkipTrackForwardHandler( Callable<Void> handler )
	{
		FlautoBackgroundAudioService.skipTrackForwardHandler = handler;
	}

	/**
	 * Remove the handler for when the user taps the button to skip the track
	 * forward.
	 */
	void removeSkipTrackForwardHandler()
	{
		FlautoBackgroundAudioService.skipTrackForwardHandler = null;
	}

	/**
	 * Add a handler for when the user taps the button to skip the track backward.
	 */
	void setSkipTrackBackwardHandler( Callable<Void> handler )
	{
		FlautoBackgroundAudioService.skipTrackBackwardHandler = handler;
	}

	/**
	 * Add a handler for when the user taps the button to pause/resume.
	 */
	void setPauseHandler( Callable<Void> handler )
	{
		FlautoBackgroundAudioService.pauseHandler = handler;
	}

	void removePauseHandler(  )
	{
		FlautoBackgroundAudioService.pauseHandler = null;
	}

	/**
	 * Remove the handler for when the user taps the button to skip the track
	 * backward.
	 */
	void removeSkipTrackBackwardHandler()
	{
		FlautoBackgroundAudioService.skipTrackBackwardHandler = null;
	}

	/**
	 * Passes the currently playing track to the media browser, in order to show the
	 * notification properly.
	 *
	 * @param track The currently playing track.
	 */
	void setNotificationMetadata( FlautoTrack track )
	{
		FlautoBackgroundAudioService.currentTrack = track;
	}

	/**
	 * Passes to the media browser the function to execute to update the playback
	 * state .
	 *
	 * @param playbackStateUpdater The function to execute to update the playback
	 *                             state .
	 */
	void setPlaybackStateUpdater( Function playbackStateUpdater )
	{
		FlautoBackgroundAudioService.playbackStateUpdater = playbackStateUpdater;
	}
}
