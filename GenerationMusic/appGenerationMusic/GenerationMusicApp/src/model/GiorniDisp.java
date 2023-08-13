package model;

import java.util.Objects;

public class GiorniDisp {
	
	String data;
	

	

	

	public GiorniDisp(String data) {
		super();
		this.data = data;
	
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GiorniDisp other = (GiorniDisp) obj;
		return Objects.equals(data, other.data);
	}

	@Override
	public String toString() {
		return "GiorniDisp [data=" + data + "]";
	}

	
	
	

}
