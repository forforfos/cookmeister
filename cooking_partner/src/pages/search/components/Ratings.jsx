import ReactStars from "react-rating-stars-component";

const Ratings = ({ rating }) => {
  return (
    <ReactStars
      activeColor="#ffd700"
      count={5}
      edit={false}
      size={20}
      isHalf={true}
      value={rating}
    />
  )
}

export default Ratings;
