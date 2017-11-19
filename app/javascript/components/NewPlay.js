import React from "react"

class NewPlay extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      newBet: 10
    };
  }

  updateBet(e){
    this.setState({
      newBet: e.target.value
    });
  }

  newGame(e){
    let data = "bet="+ this.state.newBet;

    Rails.ajax({
      type: "POST",
      url: "/play.json",
      data: data,
      success: function(response){
        //console.log("SUCCESS!!");
        window.location.reload();
      },
      error: function(repsonse){
        console.log("There was an error");
        console.log(response);
      }
    });
  }

  render () {
    return (
      <div>
        <input value={this.state.newBet} onChange={e => this.updateBet(e)} />
        <button onClick={e => this.newGame(e)}>Start New game</button>
      </div>
    );
  }
}

/*
 */

export default NewPlay
