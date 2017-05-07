/**
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.radio;

import android.hardware.radio.RadioManager;

/** {@hide} */
interface ITuner {
    void close();

    /**
     * @throws IllegalArgumentException if config is not valid or null
     */
    void setConfiguration(in RadioManager.BandConfig config);

    RadioManager.BandConfig getConfiguration();

    int getProgramInformation(out RadioManager.ProgramInfo[] infoOut);

    /**
     * @throws IllegalStateException if tuner was opened without audio
     */
    void setMuted(boolean mute);

    boolean isMuted();

    /**
     * @throws IllegalStateException if called out of sequence
     */
    void step(boolean directionDown, boolean skipSubChannel);

    /**
     * @throws IllegalStateException if called out of sequence
     */
    void scan(boolean directionDown, boolean skipSubChannel);

    /**
     * @throws IllegalArgumentException if invalid arguments are passed
     * @throws IllegalStateException if called out of sequence
     */
    void tune(int channel, int subChannel);

    /**
     * @throws IllegalStateException if called out of sequence
     */
    void cancel();
}
