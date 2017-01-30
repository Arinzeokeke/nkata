var PostIndex = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    url: React.PropTypes.string,
    user: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Url: {this.props.url}</div>
        <div>User: {this.props.user}</div>
        <div>Channel: {this.props.channel}</div>
      </div>
    );
  }
});
