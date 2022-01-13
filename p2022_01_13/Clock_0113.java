package p2022_01_13;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Clock_0113 implements Runnable {

	public void run() {

		while (true) {

			SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 // HH시 mm분 ss");
			Date d = new Date();

			System.out.println(sd.format(d));

			try {

				Thread.sleep(1000);
			} catch (Exception ie) {
				System.out.println(ie.toString());
			}
		}
	}

	public static void main(String[] args) {
		Clock_0113 co = new Clock_0113();

		Thread time = new Thread(co);

		time.start();

	}

}
